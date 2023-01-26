# Defined in - @ line 1
function pretty-log --description 'alias pretty-log=git log --graph --oneline --all --decorate'
	git log --graph --oneline --all --decorate $argv;
end
