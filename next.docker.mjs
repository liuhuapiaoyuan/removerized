
import defaultConfig from './next.config.default.mjs'
/** @type {import('next').NextConfig} */
const nextConfig = {
    ...defaultConfig,
    output: 'standalone'
};

export default nextConfig;
