release: test lint
	@git tag `grep -o -E '[0-9]\.[0-9]\.[0-9]{1,2}' gh-md-toc`
	@git push --tags origin master

test:
	@bats tests

lint:
	@shellcheck -e SC2008 gh-md-toc

build-image:
	docker build -t adoyle/toc:0.8 --build-arg "APK_PROXY=mirrors.ustc.edu.cn" .
