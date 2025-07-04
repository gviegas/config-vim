// colors.go downloads the official vim colorschemes.

package main

import (
	"archive/zip"
	"bytes"
	"errors"
	"io"
	"log"
	"net/http"
	"os"
	"strings"
)

const (
	zipSrc        = "https://github.com/vim/colorschemes/archive/refs/heads/master.zip"
	prefixDir     = "colorschemes-master/"
	colorsDir     = "colors/"
	colorsFullDir = prefixDir + colorsDir
)

func main() {
	b, err := downloadRepo()
	if err != nil {
		panic(err)
	}
	f, err := selectColorsFiles(b)
	if err != nil {
		panic(err)
	}
	err = writeColorsDir(f)
	if err != nil {
		panic(err)
	}
}

func downloadRepo() ([]byte, error) {
	resp, err := http.Get(zipSrc)
	defer func() {
		if resp != nil {
			resp.Body.Close()
		}
	}()
	if err != nil {
		return nil, err
	}
	b, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	return b, nil
}

// Takes ownership of zippedRepo.
func selectColorsFiles(zippedRepo []byte) ([]*zip.File, error) {
	br := bytes.NewReader(zippedRepo)
	zr, err := zip.NewReader(br, br.Size())
	if err != nil {
		return nil, err
	}
	zf := make([]*zip.File, 0, 32)
	for _, f := range zr.File {
		s, found := strings.CutPrefix(f.FileHeader.Name, colorsFullDir)
		if found && !strings.ContainsAny(s, "/\\") && strings.HasSuffix(s, ".vim") {
			zf = append(zf, f)
		}
	}
	return zf, nil
}

func writeColorsDir(files []*zip.File) error {
	err := os.Mkdir(colorsDir, os.ModePerm)
	if err != nil && !errors.Is(err, os.ErrExist) {
		return err
	}
	for _, f := range files {
		errFmt := "Could not create file %s:\n\t%s"
		name, found := strings.CutPrefix(f.FileHeader.Name, prefixDir)
		if !found {
			// Should not happen if selectColorsFiles
			// is used to produce the files argument.
			panic("invalid file name: " + f.FileHeader.Name)
		}
		r, err := f.Open()
		if err != nil {
			log.Printf(errFmt, name, err)
			continue
		}
		b, err := io.ReadAll(r)
		if err != nil {
			log.Printf(errFmt, name, err)
			continue
		}
		err = os.WriteFile(name, b, 0644)
		if err != nil {
			// TODO: File may have been partially written.
			log.Printf(errFmt, name, err)
		} else {
			log.Print("Created file " + name)
		}
	}
	return nil
}
