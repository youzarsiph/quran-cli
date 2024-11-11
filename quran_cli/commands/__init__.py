""" Quran CLI Commands """

from quran_cli.commands.explore import explore
from quran_cli.commands.init import init
from quran_cli.commands.normalize import normalize
from quran_cli.commands.test import test


command_list = [explore, init, normalize, test]
