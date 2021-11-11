#include "helpers.h"
#include <stdio.h>
#include <cs50.h>
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE new_image[height][width];
    //iterate over the entire image
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int Grayscale = round((image[i][j].rgbtRed + image[i][j].rgbtGreen + image[i][j].rgbtBlue)/3); //finding the average and rounding it to an integer
            //setting the values of the new image to corresponding grayscale value
            new_image[i][j].rgbtRed = Grayscale;
            new_image[i][j].rgbtGreen = Grayscale;
            new_image[i][j].rgbtBlue = Grayscale;
        }
    }
    image = new_image;
    return;
}
// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    /*
    RGBTRIPLE new_image[height][width];
    //iterate over the entire image
    for (int i = 0; i < height; i++)
        for (int j = 0; j < width; j++)
            //setting the values of the new image to corresponding reflected pixels
            new_image.rgbtRed[i][j] = image.rgbtRed[height - i - 1][width - j - 1];
            new_image.rgbtGreen[i][j] = image.rgbtGreen[height - i - 1][width - j - 1];
            new_image.rgbtBlue[i][j] = image.rgbtBlue[height - i - 1][width - j - 1];
    */
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
//Box Blur
    float box_blur[3][3] = {{1/9,1/9,1/9},{1/9,1/9,1/9},{1/9,1/9,1/9}};
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            //initialising variables to store the results in while we perform the convolution
            float Red = 0;
            float Green = 0;
            float Blue = 0;
            //iterating over kernel for convolution
            for (int k = 0; k < 3; k++)
            {
                for (int l = 0; l < 3; l++)
                {
                    if (i + k - 1 >= 0 && j + l - 1 >= 0 && i + k - 1 < height && j + l - 1 < width)
                    if (
                    {
                        Red += image[i + k - 1][j + l - 1].rgbtRed*box_blur[k][l];
                        Green += image[i + k - 1][j + l - 1].rgbtGreen*box_blur[k][l];
                        Blue += image[i + k - 1][j + l - 1].rgbtBlue*box_blur[k][l];
                    }
                }
            }
            //moving results of convolution into the image
            image[i][j].rgbtRed = cap(round(Red));
            image[i][j].rgbtGreen = cap(round(Green));
            image[i][j].rgbtBlue = cap(round(Blue));
        }
    }
    return;
}

// Detect edges
void edges(int height, int width, RGBTRIPLE image[height][width])
{
    return;
}