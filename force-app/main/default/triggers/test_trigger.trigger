trigger test_trigger on Account (before insert) {
    System.debug('Hello World!');
}