# 项目结构

以下是本项目的目录结构和各部分功能的简要说明：

## `./res/`
存放所有的 YAML 配置文件。这些文件用于保存项目配置信息，例如数据库访问路径和其他 token。

## `./src/`
目录存放所有的源码。

### `./src/common/`
存放工具函数和整个项目要使用的小型模块。

### `./src/component/`
存放项目要使用的工具类。这里对数据库相关的功能（例如 SQLAlchemy 等库）进行了二次封装。

### `./src/dao/`
存放直接操作数据库的类。

### `./src/entity/`
存放各种数据对象的定义。使用 `typing` 库的 `TypedDict` 数据类型对所有的 Python 字典进行描述，以减少开发时的错误，并避免动态类型语言在重构时的常见问题。

### `./src/route/`
保存 FastAPI 的 API 入口函数。这部分类似于 SpringBoot 中的 Controller。

### `./src/service/`
存放各种实现业务逻辑的服务类。

### `./src/app.py`
FastAPI 的 APP 定义脚本。

### `./src/run.py`
执行 `app.py` 的脚本。

## `./test/`
存放测试用例。

## `./main.py`
位于项目根目录下的入口脚本文件。每次启动项目时，从这里开始即可。该脚本直接调用 `./src/run.py`。

## `./pyproject.toml`
Poetry 使用的项目配置文件。

## `./Dockerfile.base`
用于生成 Docker 依赖的镜像。

## `./Dockerfile.build`
用于打包项目源码的镜像。