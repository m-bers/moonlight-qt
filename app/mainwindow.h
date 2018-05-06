#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtWidgets>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

protected:
    void closeEvent(QCloseEvent *event) override;

private slots:
    void on_actionExit_triggered();
    void on_newHostBtn_clicked();
    void addHostToDisplay(QMap<QString, bool>);
    void on_selectHostComboBox_activated(const QString &);

private:
    Ui::MainWindow *ui;

};

#endif // MAINWINDOW_H