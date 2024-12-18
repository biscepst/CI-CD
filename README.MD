# CI/CD Конфигурация для проекта

Этот проект использует GitLab CI/CD для автоматизации процессов сборки, тестирования и развертывания кода. Ниже представлена структура и описание этапов CI/CD пайплайна.

## Этапы пайплайна

### Стили кода (style)
На этом этапе выполняется проверка стиля кода с использованием clang-format. Если найдены несоответствия стилю Google, то выполнение пайплайна останавливается.

### Сборка (build)
На данном этапе происходит сборка бинарных файлов s21_cat и s21_grep в директории src.

### Тестирование (test)
Здесь выполняются тесты для собранных бинарников. В случае обнаружения ошибок, пайплайн завершается с ошибкой.

### Развертывание (deploy)
Развертывание производится вручную после успешного прохождения всех предыдущих этапов. На этом шаге файлы копируются в нужную директорию.

## Конфигурационные файлы

Конфигурации CI/CD находятся в файле .gitlab-ci.yml, который определяет все этапы пайплайна и их последовательность выполнения.

```yaml
stages:
  - style
  - build
  - test
  - deploy

style-job:
  stage: style
  tags: 
    - style
  script:
    - clang-format --style=Google -Werror -n src/cat/s21_cat.* src/grep/s21_grep.*
  after_script: 
    - cd src
    - chmod +x bot.sh 
    - ./bot.sh "style" "$CI_JOB_STATUS"
    - cd ../  
  only:
    - develop

build-job:
  stage: build
  tags: 
    - build
  script:
    - cd src/cat && make s21_cat
    - cd ../grep && make s21_grep
  after_script: 
    - cd src
    - chmod +x bot.sh 
    - ./bot.sh "build" "$CI_JOB_STATUS" 
  artifacts:
    paths:
      - src/cat/s21_cat
      - src/grep/s21_grep
    expire_in: 30 days
  only:
    - develop

test-job:
  stage: test
  tags:
    - test
  script:
    - (cd src/cat && make test) 2>/dev/null 1>cat_test.txt
    - (cd src/grep && make test) 2>/dev/null 1>grep_test.txt
    - |
      if ! grep -q "FAIL_TESTS: 0" cat_test.txt || ! grep -q "FAIL_TESTS: 0" grep_test.txt; then
        exit 1
      fi
  after_script:
    - cd src 
    - chmod +x bot.sh 
    - ./bot.sh "test" "$CI_JOB_STATUS"  
  only:
    - develop


deploy-job:
  stage: deploy
  when: manual
  tags:
    - deploy
  script:
    - cd src
    - chmod +x copy.sh
    - ./copy.sh
  after_script:
    - cd src 
    - chmod +x bot.sh 
    - ./bot.sh "deploy" "$CI_JOB_STATUS"
```

### Описание скриптов

- bot.sh: Этот скрипт уведомляет о статусе выполнения каждого этапа пайплайна.
- copy.sh: Скрипт, отвечающий за копирование файлов при развертывании.

## Требования к системе

Для корректного выполнения пайплайна необходимо наличие следующих инструментов:
- make: Для сборки проектов.
- clang-format: Для проверки стиля кода.