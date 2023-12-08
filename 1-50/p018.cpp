#include<iostream>
#include<fstream>
#include<string>
#include<boost/algorithm/string.hpp> // stoi() - string to int
#include<vector>
using namespace std;

#define N 15

int max_path_sum(int **tri) 
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

    int **tri = NULL;

    
    tri = (int**) malloc(N * N / 2 * sizeof(int)); 

    for (int i = 0; i < N; i++) {
        tri[i] = (int*) malloc((i + 1) * sizeof(int)); // Allocate memory for each row
    }

    // Read in the values to tri from the text file
    fin.open("supplement/p018.txt");
    for (int i = 0; i < N; i++) {
        if (fin.eof()) {
            break; // break if end of file
        }
        getline(fin, fin_line);
        vector<string> numbers;
        boost::split(numbers, fin_line, [](char c){return c == ' ';});



        for (int j = 0; j <=i; j++) {
            cout << i << "," << j << "  -  " << stoi(numbers[j]) << endl; // an error when loading the 11th line somehow
            tri[i][j] = stoi(numbers[j]); 
        }
    }
    fin.close();

    cout << "ok!" << endl;

    // Print tri to see if loading as successful
    for (int i = 0; i< N; i++) {
        for (int j = 0; j< N; j++) {
            cout << tri[i][j] << " ";
        }
        cout << endl;
    }
    // Look up why the output is weird... Why is it not a triangle as it should be? 

    int max_sum = max_path_sum(tri);

    cout << "Maximum path sum: " << max_sum << endl;
}

