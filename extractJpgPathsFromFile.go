package main

import (
	"bufio"
	"os"
	"regexp"
)

func ExtractJPGPathsFromFile(filePath string) ([]string, error) {
	file, err := os.Open(filePath)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	re := regexp.MustCompile(`/intersense/images/.*\.jpg`)

	var matches []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		match := re.FindString(line)
		if match != "" {
			matches = append(matches, match)
		}
	}
	if err := scanner.Err(); err != nil {
		return nil, err
	}

	return matches, nil
}
