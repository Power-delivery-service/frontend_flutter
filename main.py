import os

os.environ["DBHOST"] = "localhost"
os.environ["PORT"] = "8080"
os.environ["USER"] = "RED"
os.environ["PASSWORD"] = "qwerty"
os.environ["DBNAME"] = "UMRI NAHREN"

import asyncio
import logging

from aiohttp import web
from app import routes
from app import context


async def create_app(secrets) -> web.Application:
    app = web.Application()
    ctx = context.AppContext(secrets)

    routes.setup_routes(app, ctx)

    app.on_startup.append(ctx.on_startup)
    app.on_shutdown.append(ctx.on_shutdown)

    return app


if __name__ == '__main__':
    logging.basicConfig(format=u'%(filename)s [LINE:%(lineno)d] #%(levelname)-8s [%(asctime)s]  %(message)s',
                        level=logging.INFO,
                        )

    loop = asyncio.new_event_loop()
    app = loop.run_until_complete(create_app(secrets={}))
    web.run_app(app, host='127.0.0.1', port=7777)
