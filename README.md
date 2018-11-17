## Project Plan

### Label existing data set

There are PDFs of scanned ballots with a variety of marks available on GitHub.

https://github.com/OSVTAC/osv-sample-data/tree/master/2018-06-05/ballot-scans

This tool seems like it would be most useful: https://github.com/tzutalin/labelImg

The goal is to have a marked and unmarked class.

### Train the model

After labeling the images we will need to train a TensorFlow model. There are tutorials on this, just a matter of setting it up.

https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/configuring_jobs.md

### Experiment with model

Ensure that we can get reasonable identification from the model.

### Create placement guessing code

At this point the model should be able to create bounding boxes around marked and unmarked arrows. Now we need to put those arrows into three columns based on x coordinates and guess at the rows based y coordinates.

### Create ballot page model

For every page of a ballot we need to see if the guessed placement matches the expected model for that page. In other words does the number of arrow rows and arrow columns matched up to the placement guesses. If not, reject the page. If so, we can now count the votes on the ballot.

```
{
  "type": "SF1",
  "page": 1,
  "arrows": [["Governer A", "Governer B", "SF Mayor A", "SF Mayor B"], ["Treasurer A", "Treasurer B"]]
}
```

### Create ballot acceptance model

With the marks counted we will need a model on whether the marks are valid and without over votes, etc. This will require someone with experience on how this logic is usually modeled.

## References

- https://towardsdatascience.com/how-to-train-your-own-object-detector-with-tensorflows-object-detector-api-bec72ecfe1d9
