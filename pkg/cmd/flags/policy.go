package flags

import (
	"fmt"
	"strings"

	"github.com/nextlinux/tracee/pkg/errfmt"
	"github.com/nextlinux/tracee/pkg/policy"
)

// PrepareFilterMapForPolicies prepares the FilterMap for the policies
func PrepareFilterMapFromPolicies(policies []policy.PolicyFile) (FilterMap, error) {
	filterMap := make(FilterMap)

	if len(policies) == 0 {
		return nil, errfmt.Errorf("no policies provided")
	}

	if len(policies) > policy.MaxPolicies {
		return nil, errfmt.Errorf("too many policies provided, there is a limit of %d policies", policy.MaxPolicies)
	}

	policyNames := make(map[string]bool)

	for pIdx, p := range policies {
		if _, ok := policyNames[p.Name]; ok {
			return nil, errfmt.Errorf("policy %s already exist", p.Name)
		}
		policyNames[p.Name] = true

		filterFlags := make([]*filterFlag, 0)

		// scope
		for _, s := range p.Scope {
			s = strings.ReplaceAll(s, " ", "")

			if s == "global" && len(p.Scope) > 1 {
				return nil, errfmt.Errorf("policy %s, global scope must be unique", p.Name)
			}

			if s == "global" {
				break
			}

			var filterName, operatorAndValues string

			switch s {
			case "follow", "!container", "container":
				filterName = s
				operatorAndValues = ""
			default:
				operatorIdx := strings.IndexAny(s, "=!<>")
				filterName = s[:operatorIdx]
				operatorAndValues = s[operatorIdx:]
			}

			filterFlags = append(filterFlags, &filterFlag{
				full:              s,
				filterName:        filterName,
				operatorAndValues: operatorAndValues,
				policyIdx:         pIdx,
				policyName:        p.Name,
			})
		}

		for _, r := range p.Rules {
			filterFlags = append(filterFlags, &filterFlag{
				full:              fmt.Sprintf("event=%s", r.Event),
				filterName:        "event",
				operatorAndValues: fmt.Sprintf("=%s", r.Event),
				policyIdx:         pIdx,
				policyName:        p.Name,
			})

			for _, f := range r.Filter {
				operatorIdx := strings.IndexAny(f, "=!<>")

				if operatorIdx == -1 {
					return nil, errfmt.Errorf("invalid filter operator: %s", f)
				}

				filterName := f[:operatorIdx]
				operatorAndValues := f[operatorIdx:]

				// args
				if strings.HasPrefix(f, "args.") {
					filterFlags = append(filterFlags, &filterFlag{
						full:              fmt.Sprintf("%s.%s", r.Event, f),
						filterName:        fmt.Sprintf("%s.%s", r.Event, filterName),
						operatorAndValues: operatorAndValues,
						policyIdx:         pIdx,
						policyName:        p.Name,
					})

					continue
				}

				// retval
				if strings.HasPrefix(f, "retval") {
					filterFlags = append(filterFlags, &filterFlag{
						full:              fmt.Sprintf("%s.%s", r.Event, f),
						filterName:        fmt.Sprintf("%s.%s", r.Event, filterName),
						operatorAndValues: operatorAndValues,
						policyIdx:         pIdx,
						policyName:        p.Name,
					})
					continue
				}

				// context
				filterFlags = append(filterFlags, &filterFlag{
					full:              fmt.Sprintf("%s.context.%s", r.Event, f),
					filterName:        fmt.Sprintf("%s.context.%s", r.Event, filterName),
					operatorAndValues: operatorAndValues,
					policyIdx:         pIdx,
					policyName:        p.Name,
				})
			}
		}

		filterMap[pIdx] = filterFlags
	}

	return filterMap, nil
}
