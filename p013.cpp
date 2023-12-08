#include<iostream>
#include<fstream>
#include<string>
#include<boost/multiprecision/cpp_int.hpp>
#include<vector>

using namespace boost::multiprecision;
using namespace std;

int main()
{
    ifstream fin;
    string num_string;
    vector<cpp_int> nums;
    cpp_int sum;

    fin.open("supplement/p013.txt");
    
    while (1) {
        
        // These lines are needed to prevent the last line from being read twice
        if (fin.eof()) {
            break;
        }
        
        getline(fin, num_string);
        nums.emplace_back(num_string);
        cout << num_string << endl;
    };

    for(const cpp_int& num:nums)
    {
        sum += num;
    }

    cout << sum << endl;

    fin.close();
}