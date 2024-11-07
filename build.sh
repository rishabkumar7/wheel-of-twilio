#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Build the Docker image with the environment variables
docker build -t rishabincloud/wheel-of-twilio \
  --build-arg TWILIO_ACCOUNT_SID=$TWILIO_ACCOUNT_SID \
  --build-arg TWILIO_API_KEY=$TWILIO_API_KEY \
  --build-arg TWILIO_API_SECRET=$TWILIO_API_SECRET \
  --build-arg EVENT_NAME=$EVENT_NAME \
  --build-arg NEXT_PUBLIC_WEDGES=$NEXT_PUBLIC_WEDGES \
  --build-arg NEXT_PUBLIC_TWILIO_PHONE_NUMBER=$NEXT_PUBLIC_TWILIO_PHONE_NUMBER \
  --build-arg MAX_BETS_PER_USER=$MAX_BETS_PER_USER \
  --build-arg VERIFY_SERVICE_SID=$VERIFY_SERVICE_SID \
  --build-arg SYNC_SERVICE_SID=$SYNC_SERVICE_SID \
  --build-arg MESSAGING_SERVICE_SID=$MESSAGING_SERVICE_SID \
  --build-arg BASIC_AUTH_USERNAME=$BASIC_AUTH_USERNAME \
  --build-arg BASIC_AUTH_PASSWORD=$BASIC_AUTH_PASSWORD \
  --build-arg OFFER_SMALL_PRIZES=$OFFER_SMALL_PRIZES \
  .