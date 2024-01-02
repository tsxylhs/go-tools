package main

import (
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"io"
	"io/ioutil"
	"os"
)

func crypto_test() {
	// 获取命令行参数
	args := os.Args[1:]
	if len(args) < 2 {
		fmt.Println("请提供两个文件路径作为参数")
		os.Exit(1)
	}

	// 读取文件1
	file1, err := ioutil.ReadFile(args[0])
	if err != nil {
		fmt.Println("无法读取文件1:", err)
		os.Exit(1)
	}

	// 读取文件2
	file2, err := ioutil.ReadFile(args[1])
	if err != nil {
		fmt.Println("无法读取文件2:", err)
		os.Exit(1)
	}

	// 合并文件内容
	mergedContent := string(file1) + string(file2)
	// 使用 youtellme 的盐进行加密
	salt := "youtellme1233211"
	encryptedText, err := encrypt(mergedContent, salt)
	if err != nil {
		fmt.Println("加密失败:", err)
		return
	}
	fmt.Println("加密后:", encryptedText)

	// 解密
	decryptedText, err := decrypt("eIFhxBaB1DGtb8MhO1jQHoSM1w0UGYaF_QXUB3m7dpx42is2PVEktNCW6WwCYA==", salt)
	if err != nil {
		fmt.Println("解密失败:", err)
		return
	}
	fmt.Println("解密后:", decryptedText)

	//输出加密后的内容

}
func encrypt(plainText, salt string) (string, error) {
	key := []byte(salt)
	plaintext := []byte(plainText)

	block, err := aes.NewCipher(key)
	if err != nil {
		return "", err
	}

	ciphertext := make([]byte, aes.BlockSize+len(plaintext))
	iv := ciphertext[:aes.BlockSize]
	if _, err := io.ReadFull(rand.Reader, iv); err != nil {
		return "", err
	}

	stream := cipher.NewCFBEncrypter(block, iv)
	stream.XORKeyStream(ciphertext[aes.BlockSize:], plaintext)

	encryptedText := base64.URLEncoding.EncodeToString(ciphertext)
	return encryptedText, nil
}

func decrypt(encryptedText, salt string) (string, error) {
	key := []byte(salt)
	ciphertext, err := base64.URLEncoding.DecodeString(encryptedText)
	if err != nil {
		return "", err
	}

	block, err := aes.NewCipher(key)
	if err != nil {
		return "", err
	}

	if len(ciphertext) < aes.BlockSize {
		return "", fmt.Errorf("密文无效")
	}

	iv := ciphertext[:aes.BlockSize]
	ciphertext = ciphertext[aes.BlockSize:]

	stream := cipher.NewCFBDecrypter(block, iv)
	stream.XORKeyStream(ciphertext, ciphertext)

	decryptedText := string(ciphertext)
	return decryptedText, nil
}
