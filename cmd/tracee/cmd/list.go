package cmd

import (
	"os"

	"github.com/open-policy-agent/opa/compile"
	"github.com/spf13/cobra"

	tcmd "github.com/nextlinux/tracee/pkg/cmd"
	"github.com/nextlinux/tracee/pkg/cmd/initialize"
	"github.com/nextlinux/tracee/pkg/events"
	"github.com/nextlinux/tracee/pkg/logger"
	"github.com/nextlinux/tracee/pkg/signatures/signature"
)

func init() {
	rootCmd.AddCommand(listCmd)
	listCmd.Flags().String(
		"signatures-dir",
		"",
		"Directory where to search for signatures in CEL (.yaml), OPA (.rego), and Go plugin (.so) formats",
	)
}

var listCmd = &cobra.Command{
	Use:     "list",
	Aliases: []string{"l"},
	Short:   "List traceable events",
	Long:    ``,
	Run: func(cmd *cobra.Command, args []string) {
		// Get signatures to update event list

		sigsDir, err := cmd.Flags().GetString("signatures-dir")
		if err != nil {
			logger.Fatalw("Failed to get signatures-dir flag", "err", err)
			os.Exit(1)
		}

		sigs, err := signature.Find(
			compile.TargetRego,
			false,
			sigsDir,
			nil,
			false,
		)
		if err != nil {
			logger.Fatalw("Failed to find signatures", "err", err)
			os.Exit(1)
		}

		initialize.CreateEventsFromSignatures(events.StartSignatureID, sigs)
		tcmd.PrintEventList(true) // list events
	},
	DisableFlagsInUseLine: true,
}
