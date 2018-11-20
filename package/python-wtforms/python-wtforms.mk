################################################################################
#
# python-wtforms
#
################################################################################

PYTHON_WTFORMS_VERSION = 2.2.1
PYTHON_WTFORMS_SOURCE = WTForms-$(PYTHON_WTFORMS_VERSION).tar.gz
PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/cd/1d/7221354ebfc32b868740d02e44225c2ce00769b0d3dc370e463e2bc4b446
PYTHON_WTFORMS_SETUP_TYPE = setuptools

$(eval $(python-package))
