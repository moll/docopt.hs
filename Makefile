TEST =
TEST_OPTS = --color

love: cabal.project.local
love: compile

compile:
	cabal v2-build lib:docopt

autocheck:
	ghcid -c "cabal v2-repl" --warnings

test:
	@cabal v2-run test:tests -- --format=progress $(TEST_OPTS) $(TEST)

spec:
	@cabal v2-run test:tests -- --format=specdoc $(TEST_OPTS) $(TEST)

cabal.project.local:
	cabal v2-configure --enable-tests --enable-optimization=0

clean:
	cabal v2-clean

.PHONY: love
.PHONY: compile
.PHONY: test spec
.PHONY: clean
