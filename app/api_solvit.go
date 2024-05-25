package solvit

import (
	. "yo/srv"
	. "yo/util"
)

func init() {
	Apis(ApiMethods{
		"_/helloName": apiHelloName.Checks(
			Fails{Err: "ExpectedName", If: __helloNameName.Equal("")},
		),
	})
}

var apiHelloName = api(func(this *ApiCtx[struct {
	Name string
}, Return[string]]) {
	this.Ret.Result = "Solvit, " + this.Args.Name
})
