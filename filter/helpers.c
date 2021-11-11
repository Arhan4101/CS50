#include "helpers.h"
#include <math.h>

int cap(int a);

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int Grayscale = cap(round((image[i][j].rgbtRed + image[i][j].rgbtGreen + image[i][j].rgbtBlue)/3));
            image[i][j].rgbtRed = Grayscale;
            image[i][j].rgbtGreen = Grayscale;
            image[i][j].rgbtBlue = Grayscale;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < floor(width/2); j++)
        {
            RGBTRIPLE tmp = image[i][j];
            image[i][j] = image[i][width - 1 - j];
            image[i][width - j - 1] = tmp;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    //Declaring temporary image
    RGBTRIPLE new_image[height][width];
    //Iterating over every pixel
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            float pixel_red = 0;
            float pixel_green = 0;
            float pixel_blue = 0;
            int count = 0;
            for (int k = i - 1; k < i + 2; k++)
            {
                for (int l = j - 1; l < j + 2; l++)
                {
                    if (k >= 0 && l >= 0 && k < height && l < width)
                    {
                        pixel_red += image[k][l].rgbtRed;
                        pixel_green += image[k][l].rgbtGreen;
                        pixel_blue += image[k][l].rgbtBlue;
                        count++;
                    }
                }
            new_image[i][j].rgbtRed = cap(pixel_red/count);
            new_image[i][j].rgbtGreen = cap(pixel_green/count);
            new_image[i][j].rgbtBlue = cap(pixel_blue/count);
            }
        }
    }
    for (int i = 0; i < height;i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j].rgbtRed = new_image[i][j].rgbtRed;
            image[i][j].rgbtGreen = new_image[i][j].rgbtGreen;
            image[i][j].rgbtBlue = new_image[i][j].rgbtBlue;
        }
    }
    return;
}

// Detect edges
void edges(int height, int width, RGBTRIPLE image[height][width])
{
    //Declaring Sobel X
    
    //Declaring Sobel Y
    
    //Applying Sobel X
    
    //Applying Sobel Y
    
    //Generating Gradient
    return;
}

//cap function
int cap(int a)
{
    if (a > 255)
    {
        a = 255;
    }
    else if (a < 0)
    {
        a = 0;
    }
    return a;
}