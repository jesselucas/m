package main

import (
	"flag"
	"fmt"
	"os"
	"time"

	"github.com/jesselucas/m"
)

func main() {
	versionUsage := "Semantic Version of r"
	versionPtr := flag.Bool("version", false, versionUsage)
	flag.BoolVar(versionPtr, "v", false, versionUsage+" (shorthand)")
	flag.Parse()

	// if the version flag is passed print the r package version and exit
	if *versionPtr {
		fmt.Println(m.Version)
		os.Exit(0)
	}

	mapCommands(os.Args[1:])
}

func mapCommands(args []string) {
	fmt.Println(args)

	switch args[0] {
	case "record":
		fmt.Println("m: Commands are now being recorded.")
		time.Sleep(5 * time.Second)
		fmt.Println("finished sleep")
	}

	os.Exit(0)
}
