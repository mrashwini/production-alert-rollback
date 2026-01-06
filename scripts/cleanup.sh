#!/bin/bash
# Enhanced deploy.sh with auto-rollback
# Deploy or update prod-alert-app and rollback on failure

DEPLOYMENT_NAME="prod-alert-app"
NAMESPACE="default"   # change if using another namespace

echo "🚀 Applying deployment YAML..."
kubectl apply -f ./k8s/prod-alert-app.yaml

echo "🔄 Restarting deployment to pick up changes..."
kubectl rollout restart deployment $DEPLOYMENT_NAME

echo "⏳ Watching rollout status..."
if ! kubectl rollout status deployment $DEPLOYMENT_NAME --timeout=60s; then
    echo "⚠️ Rollout failed! Auto-rolling back..."
    kubectl rollout undo deployment $DEPLOYMENT_NAME
    echo "⏳ Watching rollback status..."
    kubectl rollout status deployment $DEPLOYMENT_NAME
    echo "✅ Rollback complete. Deployment reverted to previous stable version."
    exit 1
fi

echo "✅ Deployment successful!"
echo "📦 Current pods:"
kubectl get pods -l app=$DEPLOYMENT_NAME

echo "🌐 Service info:"
kubectl get svc prod-alert-app-service
