#!/bin/bash
# Rollback prod-alert-app to previous version

echo "↩️ Rolling back deployment..."
kubectl rollout undo deployment prod-alert-app

echo "⏳ Watching rollback status..."
kubectl rollout status deployment prod-alert-app

echo "📦 Current pods:"
kubectl get pods -l app=prod-alert-app

echo "🌐 Service info:"
kubectl get svc prod-alert-app-service
