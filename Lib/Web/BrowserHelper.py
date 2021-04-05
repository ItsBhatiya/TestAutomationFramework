from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.action_chains import ActionChains
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class BrowserHelper(object):
    """
    == Description ==
    class for all helper functions
    """

    def remove_dialog(self, xpath):
        """
        == Description ==
        Clicks on webpage to remove unwanted dialog
        param xpath: Dialog xpath
        """
        selenium_instance = BuiltIn().get_library_instance('SeleniumLibrary')
        curr_driver = selenium_instance.driver
        element = curr_driver.find_element_by_xpath(xpath)

        action = webdriver.common.action_chains.ActionChains(curr_driver)

        action.move_to_element(element).click().perform()
        action.move_by_offset(100, 100).click().perform()
        action.move_by_offset(175.75, 215.27).click().perform()
