package m

import "fmt"

const (
	Version = "0.0.1"
)

type Macro struct {
	Name        string
	Subcommands []string
}

func (macro *Macro) New() error {
	// Create file on disk

	return nil
}

func (macro *Macro) Add(cmd string) error {
	fmt.Println("add:", cmd)

	return nil
}
