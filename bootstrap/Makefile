.POSIX:

default: namespace check-namespaces argocd root

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -
	sleep 60

.PHONY: check-namespaces
check-namespaces:
	@echo "Checking if namespaces and CRDs are available..."
	@kubectl get namespace argocd &> /dev/null || (echo "Namespace argocd not found."; exit 1)
	@kubectl get crd applications.argoproj.io &> /dev/null || (echo "CRD applications.argoproj.io not found."; exit 1)
	@kubectl get crd applicationsets.argoproj.io &> /dev/null || (echo "CRD applicationsets.argoproj.io not found."; exit 1)
	@echo "Namespaces and CRDs are available."

.PHONY: argocd
argocd:
	@echo "Proceeding with argocd..."
	@cd argocd && ./apply.sh

.PHONY: root
root:
	@echo "Proceeding with root..."
	@cd root && ./apply.sh