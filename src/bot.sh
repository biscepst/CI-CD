#!/bin/bash

TELEGRAM_TOKEN="8179626685:AAE8KPqiUHzHruzpco8I-d0FiZwR5IZDQnY"
TELEGRAM_CHAT_ID="427531798"
TIME=10 
 
URL="https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage"

if [ "$CI_JOB_STATUS" = "success" ]; then
    TEXT="Stage $1 completed successfully✅%0A%0AStatus: $2%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"  
else
    TEXT="Stage $1 failed🗿%0A%0AStatus: $2%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"
fi

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_CHAT_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
