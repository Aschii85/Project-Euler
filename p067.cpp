#include<iostream>
#include<fstream>
#include<string>
#include<boost/algorithm/string.hpp>
#include<vector>
using namespace std;

#define N 100 // Important to change this according to the dimenions of the triangle to be analysed

int max_path_sum(int tri[][N]) 
{   
    // loop for bottom-up calculation
    for (int i=N-2; i>=0; i--)
     {
        for (int j=0; j<=i; j++)
        {
            // for each element, check both
            // elements just below the number
            // and below right to the number
            // add the maximum of them to it
            if (tri[i][j] != 0) {
                if (tri[i+1][j] > tri[i+1][j+1]) {
                tri[i][j] += tri[i+1][j];
                } else {
                    tri[i][j] += tri[i+1][j+1];
                }
            } 
        }
     }
 
     // return the top element
     // which stores the maximum sum
     return tri[0][0];
}

int main()
{
    ifstream fin;
    string fin_line;

    int tri[N][N];

    // Set all value of tri matrix to zero
    for (int i = 0; i< N; i++) {
        for (int j = 0; j< N; j++) {
            tri[i][j] = 0;
        }
    }

    // Read in the values to tri from the text file
    fin.open("supplement/p067.txt");
    for (int i = 0; i < N; i++) {
        if (fin.eof()) {
            break;
        }
        getline(fin, fin_line);
        vector<string> numbers;
        boost::split(numbers, fin_line, [](char c){return c == ' ';});

        for (int j = 0; j <=i; j++) {
            tri[i][j] = stoi(numbers[j]);
        }
    }
    fin.close();

    /*
    // Print tri to see if loading as successful
    for (int i = 0; i< N; i++) {
        for (int j = 0; j< N; j++) {
            cout << tri[i][j] << " ";
        }
        cout << endl;
    } */

    int max_sum = max_path_sum(tri);

    cout << "Maximum path sum: " << max_sum << endl;
}

