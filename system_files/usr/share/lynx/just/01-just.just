default:
	@lynx-just --choose

lynx-dots-override:
	chezmoi apply -S /usr/share/lynx/lynx-dots --config $HOME/.config/lynx/chezmoi/chezmoi.toml
