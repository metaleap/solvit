package main

import (
	"context"
	"embed"
	"fmt"

	"github.com/wailsapp/wails/v2"
	"github.com/wailsapp/wails/v2/pkg/options"
	"github.com/wailsapp/wails/v2/pkg/options/assetserver"
)

//go:embed frontend
var staticFs_WailsEmbed embed.FS

func main() {
	app := App{}
	err := wails.Run(&options.App{
		Title: "Hola!!",
		AssetServer: &assetserver.Options{
			Assets: staticFs_WailsEmbed,
		},
		OnStartup: app.startup,
		Bind: []interface{}{
			&app,
		},
	})
	if err != nil {
		panic(err)
	}
}

type App struct {
	ctx context.Context
}

func (b *App) startup(ctx context.Context) {
	b.ctx = ctx
}

func (b *App) Greet(name string) string {
	return fmt.Sprintf("Hello %s!", name)
}
