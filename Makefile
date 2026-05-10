PNGS := $(shell find . -name "*.png" \
    -not -path "./_site/*"   \
    -not -path "./.quarto/*" \
    -not -path "./_freeze/*" \
    -not -path "./public/*")

.PHONY: webp

webp:
	@for f in $(PNGS); do \
	    cwebp -q 85 "$$f" -o "$${f%.png}.webp" && rm "$$f"; \
	done
	@find . -name "*.qmd" \
	    -not -path "./_site/*"   \
	    -not -path "./.quarto/*" \
	    | xargs sed -i '' 's/\.png/.webp/g'

.PHONY: webp2png
webp2png:
	@for f in $(PNGS); do \
	    dwebp "$$f" -o "$${f%.webp}.png"; \
	done
