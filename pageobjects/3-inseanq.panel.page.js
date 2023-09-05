class PanelPage {
    btnBurger () {
        return $('(//*[@class="MuiIconButton-label"])');
    }
    
    sectionMenu (num) {
        return $(`(//*[@class="MuiList-root"])/*[${num}]`);
    }
}
module.exports = new PanelPage();