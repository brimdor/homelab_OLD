.POSIX:

default: namespace argocd root

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -
	@echo "Namespace argocd created."

.PHONY: argocd
argocd: wait_for_crd
	cd argocd && ./apply.sh

.PHONY: root
root:
	cd root && ./apply.sh

.PHONY: wait_for_crd
wait_for_crd:
	@echo "Waiting for CRDs to become available..."
	@until kubectl get crd applications.argoproj.io applicationsets.argoproj.io &> /dev/null; do \
		echo "CRDs not found. Retrying in 5 seconds..."; \
		sleep 5; \
	done
	@echo "CRDs are available."
	sleep 5

