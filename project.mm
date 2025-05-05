#include <iostream>
#include <string>
using namespace std;

class Appliances {
protected:
    string name;
    bool status;
public:
    Appliances(string n) : name(n), status(false) {}

    virtual void turnOn() {
        status = true;
        cout << name << " turned ON." << endl;
    }

    virtual void turnOff() {
        status = false;
        cout << name << " turned OFF." << endl;
    }

    virtual void getStatus() {
        cout << name << " is " << (status ? "ON" : "OFF") << endl;
    }
};

class SmartLight : public Appliances {
public:
    SmartLight(string n) : Appliances(n) {}
};

class SmartFan : public Appliances {
public:
    SmartFan(string n) : Appliances(n) {}
};

class SmartTV : public Appliances {
public:
    SmartTV(string n) : Appliances(n) {}
};

class DoorLock : public Appliances {
public:
    DoorLock(string n) : Appliances(n) {}
};

void menu() {
    cout << "\n=== Smart Home Simulator ===" << endl;
    cout << "1. Turn ON appliances" << endl;
    cout << "2. Turn OFF appliances" << endl;
    cout << "3. Check appliances status" << endl;
    cout << "4. Exit" << endl;
    cout << "Enter your choice: ";
}

int main() {
    SmartLight smartLight("Living Room Smart Light");
    SmartFan smartFan("Bedroom Smart Fan");
    SmartTV smartTV("Living Room Smart TV");
    DoorLock door("Main Door Lock");

    int choice, appliancesChoice;

    while (true) {
        menu();
        cin >> choice;

        if (choice == 4) {
            cout << "Exiting Smart Home Simulator. Goodbye!" << endl;
            break;
        }

        cout << "\nSelect Appliances:" << endl;
        cout << "1. Smart Light\n2. Smart Fan\n3. Smart TV\n4. Door Lock" << endl;
        cout << "Enter appliances number: ";
        cin >> appliancesChoice;

        Appliances* selectedAppliances = nullptr;

        switch (appliancesChoice) {
            case 1: selectedAppliances = &smartLight; break;
            case 2: selectedAppliances = &smartFan; break;
            case 3: selectedAppliances = &smartTV; break;
            case 4: selectedAppliances = &door; break;
            default: cout << "Invalid appliances selection!" << endl; continue;
        }

        switch (choice) {
            case 1: selectedAppliances->turnOn(); break;
            case 2: selectedAppliances->turnOff(); break;
            case 3: selectedAppliances->getStatus(); break;
            default: cout << "Invalid choice!" << endl;
        }
    }

    return 0;
}