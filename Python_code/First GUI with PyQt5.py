import sys
from PyQt5.QtWidgets import (
    QDialog,
    QApplication,
    QLineEdit,
    QPushButton,
)


class DlfMain(QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('Second GUI')
        self.resize(300, 200)  # resize QDialog window

        self.ledText = QLineEdit('Default Text', self)  # one line text
        self.ledText.move(90, 50)  # move ledText to axis x=90, y=50

        self.btnUpdate = QPushButton('Update Window title', self)  # create button
        self.btnUpdate.move(90, 80)  # move btnUpdate to axis x=90, y=80
        self.btnUpdate.clicked.connect(self.evt_btn_update_clicked)  # event on button click

    def evt_btn_update_clicked(self) -> None:
        """
        Event handler when clicked on the button btnUpdate we update title window
        :return: None
        """
        self.setWindowTitle(self.ledText.text())  # self.ledText - one line text


if __name__ == '__main__':
    app = QApplication(sys.argv)  # create application
    dlgMain = DlfMain()  # create GUI window
    dlgMain.show()  # show GUI
    sys.exit(app.exec_())  # execute the application
