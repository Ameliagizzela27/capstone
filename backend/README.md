# Backend

## Development

### Building Dockerimage

```
docker buildx build --tag <tag> --file Dockerfile .
```

### Running Dockerimage

```
docker run -p 5000:5000 <tag>  
```

### Accessing Endpoint

```
curl -H "Content-Type: application/json" -X POST localhost:5000/predict
```

## Deploying to CloudRun

```
gcloud run services replace service.yaml
```
