package logtofile

import (
	"crypto/tls"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	// 获取命令行参数
	args := os.Args[1:]
	if len(args) < 2 {
		fmt.Println("请提供图片下载域名和日志文件路径 例如： ./test(可执行文件)   https://www.studio95.com(域名)   ./logs/(日志)")
		os.Exit(1)
	}
	fmt.Println("使用的域名：", args[0])
	fmt.Println("日志路径:", args[1])

	err := filepath.Walk(args[1], func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}

		if !info.IsDir() && filepath.Ext(path) == ".log" {
			fmt.Println("Log file:", path)
			paths, err := ExtractJPGPathsFromFile(path)
			if err != nil {
				fmt.Println("errors", err)
			}
			for _, path := range paths {
				fmt.Println("获取到的图片:", path)
				downloadUrl(args[0] + path)
			}

		}
		return nil
	})
	if err != nil {
		log.Fatal(err)
	}

}
func downloadUrl(url string) (err error) {
	transport := &http.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: transport}

	resp, err := client.Get(url)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	filename := getFilename(url)

	// //tempFile, err := os.CreateTemp("./temp", filename)
	// if err != nil {
	// 	return err
	// }
	fmt.Println("临时文件目录", filename)
	body, err := io.ReadAll(resp.Body)
	defer resp.Body.Close()
	// 将HTTP响应的内容写入临时文件
	err = os.WriteFile("./temp/"+filename, body, 0666)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	//defer tempFile.Close()
	return nil
}
func getFilename(url string) string {
	// 从URL中提取文件名，可以根据需要修改提取逻辑
	// 这里简单地假设URL中最后一个斜杠后面的部分是文件名
	lastSlashIndex := strings.LastIndex(url, "/")
	if lastSlashIndex != -1 {
		return url[lastSlashIndex+1:]
	}
	return ""
}
