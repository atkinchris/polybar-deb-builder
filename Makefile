build:
	docker build -t builder .
	docker run --rm -it -v `pwd`/output:/output builder
