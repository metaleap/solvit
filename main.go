package main

import (
	"yo"

	solvit "solvit/app"
)

func main() {
	solvit.Init() // keep in `main()`, dont move to `init()`
	doListenAndServe := yo.Init(staticFs_Yo, staticFs_App)
	solvit.OnBeforeListenAndServe()
	doListenAndServe()
}
