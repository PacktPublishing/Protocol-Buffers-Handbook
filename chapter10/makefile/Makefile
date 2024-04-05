SOURCES=$(wildcard proto/*.proto proto/**/*.proto)
GEN=$(SOURCES:.proto=.pb.go)

%.pb.go : %.proto
	$(info compiling $<)
	@protoc --go_out=. --go_opt=paths=source_relative $<

all: clean my_program ## cold launch the program

my_program: $(GEN) ## launch the program
	$(info running app)
	@go run .

clean: ## cleanup generated code
	$(info removing $(GEN))
	@rm -f $(GEN)

help: ## displays this help menu
	@grep -E '^[a-zA-Z_-]+:.*?\#\# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?\#\# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
