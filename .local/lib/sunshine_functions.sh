watch_device_and_shutdown(){
  MAX_RETRIES=60       # try for up to 60 times
  DELAY=60             # wait 60 seconds between tries
  COUNT=0

  echo "🕵️ Watching for device to go offline..."

  while (( COUNT < MAX_RETRIES )); do
    STATUS=$(curl -s -H "Authorization: Bearer $AUTH_TOKEN" "$URL/api/collections/devices/records/$SUNSHINE_ID" | jq -r '.status')

    if [[ "$STATUS" == "offline" ]]; then
      echo "✅ Device is offline. Turning off Shelly plug."
      curl -s -u "$SHELLY_USER:$SHELLY_PASS" "http://$SHELLY_IP/relay/0?turn=off"
      exit 0
    fi

    echo "⌛ Attempt $((COUNT + 1)): Device still online..."
    sleep $DELAY
    ((COUNT++))
  done

  echo "⚠️ Timeout reached. Device still online after $((MAX_RETRIES * DELAY / 60)) minutes."
  Optional: Force Shelly off anyway
  curl -s -u "$SHELLY_USER:$SHELLY_PASS" "http://$SHELLY_IP/relay/0?turn=off"
}
