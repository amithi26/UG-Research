method swap(arr: array<int>, i: int, j: int)
    requires 0 <= i < arr.Length
    requires 0 <= j < arr.Length
    modifies arr
{
    var temp := arr[i];
    arr[i] := arr[j];
    arr[j] := temp;
}

method partition(arr: array<int>, low: int, high: int) returns (pivotIndex: int)
    requires 0 <= low < high < arr.Length
    modifies arr
    ensures low <= pivotIndex <= high
{
    var pivot := arr[high];  // choosing pivot as the last element
    var i := low - 1;
    var j := low;

    while j < high  // iterating up to high - 1
        invariant low <= j <= high
        invariant low - 1 <= i < j
    {
        if arr[j] < pivot {
            i := i + 1;
            swap(arr, i, j);
        }
        j := j + 1;
    }

    swap(arr, i + 1, high);
    return i + 1;
}


//recursive method
method quickSort(arr: array<int>, low: int, high: int)
    requires 0 <= low <= high < arr.Length
    modifies arr
    decreases high - low + 1
{
    if low < high {
        var pi := partition(arr, low, high);
        if pi > low {  // ensuring valid range for left partition 
            quickSort(arr, low, pi - 1);
        }
        if pi < high {  // ensuring valid range for right partition (bc for some reason I can't ensure in partition method??)
            quickSort(arr, pi + 1, high);
        }
    }
}

method printArr(arr: array<int>)
{
    var i := 0;
    while i < arr.Length
        decreases arr.Length - i
        invariant 0 <= i <= arr.Length
    {
        print arr[i], " ";
        i := i + 1;
    }
    print "\n";
}

method Main(){
    var arr := new int[6];
    arr[0] := 10;
    arr[1] := 7;
    arr[2] := 8;
    arr[3] := 9;
    arr[4] := 1;
    arr[5] := 5;

    print "Original array: ";
    printArr(arr);

    quickSort(arr, 0, arr.Length - 1);

    print "Sorted array: ";
    printArr(arr);
}
