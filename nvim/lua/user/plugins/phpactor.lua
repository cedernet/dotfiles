return {
	'phpactor/phpactor',
	build = 'composer install --no-dev --optimize-autoloader',
	ft = 'php',
	keys = {
		{ '<Leader>pm', ':PhpactorContextMenu<CR>' },
		{ '<Leader>im', ':PhpactorImportMissingClasses<CR>' },
		{ 'gh', ':PhpactorGotoDefinition hsplit<CR>' },
	}
}

