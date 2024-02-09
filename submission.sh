!bash
echo "Deleting a tag"
git tag -d checkpoint-2
git push --tags
echo "Creating a new tag"
git tag -f checkpoint-2
git push -f --tags
echo "Moving to submission directory"
cd ..
echo "Removing old tar file"
rm -f useitkal.tar
echo "Creating tar file"
tar -cf useitkal.tar 15-441-project-1
echo "Moving back to project directory"
cd 15-441-project-1
echo "Done"