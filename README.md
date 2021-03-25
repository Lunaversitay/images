# Java 8 and 11 bundle

This image is mostly made to resolve the Minecraft issue with 1.12.2 (and under) builds only really supporting Java 8 whether it be through mods and what not, and the newer versions needing Java 11 after 1.17

I've made a small little guide if you're using the ![WISP Gamepanel](https://wisp.gg) so it should be fairly easy to get setup for yourself!

# Using the image for your Minecraft server using ![WISP Gamepanel](https://wisp.gg)

Note: If you have a large amount of existing servers already it would be best to create a new egg for new orders to be placed on this egg as the Docker Image currently doesn't mass change to all servers and will have to be changed manually. (Startup Parameters however will mass change unless they where manually edited)

1. Navigate to Nests -> Minecraft -> Your desired Minecraft egg (usually the default aka vanilla is the best choice)
2. In the "Docker Image" input add the image `quay.io/lunaversity/eggs:java-bundle`
3. On the "Startup Command" input add the following to the **first** parameter `java{{runtime}}`
4. Click the "Save" button to save your changes
5. Go to the "Variables" tab on the egg
6. Create a new variable
7. Replicate the image below for the Java Version startup parameter
![](https://i.imgur.com/ublfGUv.png)
8. Save the new variable you just created
9. You're done! Any servers created with these changes will now have access to Java 8 and 11.

Note: If you have existing servers you will have to change the Docker Image to `quay.io/lunaversity/eggs:java-bundle` on the existing servers for them to utilize Java 8 and 11.
Refer to the first note for the solution to a large amount of existing servers.

That's pretty much it, if you have anything you'd like answering you can ask in the ![WISP Discord](https://wisp.gg/discord) and someone should be-able to help you in the eggs channel.
