.PHONY: clean All

All:
	@echo "----------Building project:[ alios - BuildSet ]----------"
	@make -f  "alios.mk"
clean:
	@echo "----------Cleaning project:[ alios - BuildSet ]----------"
	@make -f  "alios.mk" clean
