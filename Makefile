CWD=$(shell pwd)
OPENSHELL_DIR=$(CWD)/submodule/openshell
LOCAL_RPM_REPO_DIR=$(CWD)/repo

build-openshell-container:
	podman build -f containers/Containerfile.openshell-build -t openshell-build .

build-openshell: build-openshell-container
	mkdir -p $(LOCAL_RPM_REPO_DIR)
	podman run --security-opt label=disable -v $(OPENSHELL_DIR):/build --workdir /build openshell-build bash -c 'packit build locally'
	cp $(OPENSHELL_DIR)/x86_64/*.rpm $(LOCAL_RPM_REPO_DIR)/
	createrepo_c $(LOCAL_RPM_REPO_DIR)/