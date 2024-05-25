package solvit

import (
	"yo"

	. "yo/srv"
	. "yo/util"
	"yo/util/str"
)

func init() {
	yo.AppPkgPath = solvitPkg.PkgPath()
	AppSideStaticRePathFor = func(reqUrlPath string) string {
		return If(str.Begins(reqUrlPath, "_/"), "", "__static/solvit.html")
	}
}

func Init() {
	// yodb.Ensure[T] calls here
}

func OnBeforeListenAndServe() {
	// yodb.Upsert[yojobs.JobDef] calls here
}
