<script setup lang="ts">
import CoreFeature3Col from '../components/home/CoreFeature3Col.vue';
import FeatureHttp from '../components/home/FeatureHttp.vue';
import FeatureTcp from '../components/home/FeatureTcp.vue';
import FeatureInspect from '../components/home/FeatureInspect.vue';
import FeatureConfig from '../components/home/FeatureConfig.vue';
import FeatureOptions from '../components/home/FeatureOptions.vue';
import FeatureToolbar from '../components/home/FeatureToolbar.vue';
import HeadingSection2 from '../components/home/HeadingSection2.vue';
import HeadingSection4 from '../components/home/HeadingSection4.vue';
import Hero from '../components/home/Hero.vue';
import InstallCommand from '../components/home/InstallCommand.vue';
import ProductivityGrid from '../components/home/ProductivityGrid.vue';
import Terminal from '../components/home/Terminal.vue';
</script>

<template>
  <Hero />
  <Terminal />
  <InstallCommand />
  <CoreFeature3Col />
  <HeadingSection2 />
  <ProductivityGrid />
  <section id="features" data-theme="dark" class="bg-primary">
    <HeadingSection4 />
    <FeatureToolbar />
    <FeatureHttp />
    <FeatureTcp />
    <FeatureInspect />
    <FeatureConfig />
    <FeatureOptions />
  </section>
</template>
