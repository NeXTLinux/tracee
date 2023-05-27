package main

import "github.com/nextlinux/tracee/types/detect"

var ExportedSignatures = []detect.Signature{
	// Instrumentation e2e signatures
	&e2eVfsWrite{},
	&e2eFileModification{},
	&e2eSecurityInodeRename{},
	&e2eContainersDataSource{},
}
