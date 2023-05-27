module github.com/nextlinux/tracee

go 1.19

require (
	github.com/aquasecurity/libbpfgo v0.4.8-libbpf-1.2.0.0.20230509162948-80f41e18e690
	github.com/aquasecurity/libbpfgo/helpers v0.4.6-0.20230321190037-f591a2c5734f
	github.com/containerd/containerd v1.7.0
	github.com/docker/docker v23.0.5+incompatible
	github.com/golang/protobuf v1.5.3
	github.com/google/cel-go v0.15.1
	github.com/google/gopacket v1.1.19
	github.com/hashicorp/golang-lru v0.5.4
	github.com/kubernetes/cri-api v0.27.1
	github.com/open-policy-agent/opa v0.52.0
	github.com/prometheus/client_golang v1.15.1
	github.com/pyroscope-io/pyroscope v0.37.2
	github.com/sashabaranov/go-gpt3 v1.4.0
	github.com/spf13/cobra v1.7.0
	github.com/spf13/viper v1.15.0
	github.com/stretchr/testify v1.8.3
	github.com/urfave/cli/v2 v2.25.3
	go.uber.org/zap v1.24.0
	golang.org/x/sys v0.8.0
	google.golang.org/genproto v0.0.0-20230410155749-daa745c078e1
	google.golang.org/grpc v1.55.0
	google.golang.org/protobuf v1.30.0
	gopkg.in/yaml.v2 v2.4.0
	gotest.tools v2.2.0+incompatible
	kernel.org/pub/linux/libs/security/libcap/cap v1.2.68
)

require (
	github.com/IBM/fluent-forward-go v0.2.1 // indirect
	github.com/Microsoft/go-winio v0.6.0 // indirect
	github.com/PuerkitoBio/purell v1.1.1 // indirect
	github.com/PuerkitoBio/urlesc v0.0.0-20170810143723-de5bf2ad4578 // indirect
	github.com/StackExchange/wmi v0.0.0-20210224194228-fe8f1750fd46 // indirect
	github.com/aquasecurity/libbpfgo v0.3.0-libbpf-0.8.0 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/emicklei/go-restful v2.16.0+incompatible // indirect
	github.com/go-logr/logr v1.2.4 // indirect
	github.com/go-ole/go-ole v1.2.5 // indirect
	github.com/go-openapi/jsonpointer v0.19.5 // indirect
	github.com/go-openapi/jsonreference v0.20.0 // indirect
	github.com/go-openapi/swag v0.21.1 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/google/gnostic v0.5.7-v3refs // indirect
	github.com/google/gofuzz v1.2.0 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/mailru/easyjson v0.7.7 // indirect
	github.com/mitchellh/go-ps v1.0.0 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/pyroscope-io/dotnetdiag v1.2.1 // indirect
	github.com/shirou/gopsutil v3.21.4+incompatible // indirect
	github.com/tklauser/go-sysconf v0.3.6 // indirect
	github.com/tklauser/numcpus v0.2.2 // indirect
	github.com/valyala/bytebufferpool v1.0.0 // indirect
	golang.org/x/net v0.9.0 // indirect
	golang.org/x/oauth2 v0.6.0 // indirect
	golang.org/x/term v0.7.0 // indirect
	golang.org/x/text v0.9.0 // indirect
	golang.org/x/time v0.3.0 // indirect
	google.golang.org/appengine v1.6.7 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	k8s.io/api v0.26.2 // indirect
	k8s.io/apimachinery v0.26.2 // indirect
	k8s.io/client-go v0.26.2 // indirect
	k8s.io/klog/v2 v2.90.1 // indirect
	k8s.io/kube-openapi v0.0.0-20221012153701-172d655c2280 // indirect
	k8s.io/utils v0.0.0-20230220204549-a5ecb0141aa5 // indirect
	sigs.k8s.io/json v0.0.0-20220713155537-f223a00ba0e2 // indirect
	sigs.k8s.io/structured-merge-diff/v4 v4.2.3 // indirect
	sigs.k8s.io/yaml v1.3.0 // indirect
)

require (
	github.com/cpuguy83/go-md2man/v2 v2.0.2 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/common v0.42.0 // indirect
	github.com/rogpeppe/go-internal v1.10.0 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/xrash/smetrics v0.0.0-20201216005158-039620a65673 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace github.com/kubernetes/cri-api => k8s.io/cri-api v0.23.5-rc.0
