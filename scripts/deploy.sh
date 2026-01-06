#!/bin/bash
# Deploy or update prod-alert-app

echo "🚀 Applying deployment YAML..."
kubectl apply -f ./k8s/prod-alert-app.yaml

echo "🔄 Restarting deployment to pick up changes..."
kubectl rollout restart deployment prod-alert-app

echo "⏳ Watching rollout status..."
kubectl rollout status deployment prod-alert-app

echo "📦 Current pods:"
kubectl get pods -l app=prod-alert-app

echo "🌐 Service info:"
kubectl get svc prod-alert-app-service
